 Kubernetes

O Selenium é uma ferramenta de automação de navegador usada principalmente para testar aplicativos da web. No entanto, quando o Selenium é usado em um pipeline de IC para testar aplicativos, geralmente há uma disputa em torno do uso dos recursos do Selenium. Este exemplo mostra como implantar o Selenium no Kubernetes de forma escalável.

### Pré-requisitos

Este exemplo supõe que você tenha um cluster Kubernetes em funcionamento e um cliente kubectl configurado corretamente. Consulte os [Guias de introdução] (https://kubernetes.io/docs/getting-started-guides/) para obter detalhes.

O Google Container Engine também é uma maneira rápida de colocar o Kubernetes em funcionamento: https://cloud.google.com/container-engine/

Seu cluster deve ter 4 CPU e 6 GB de RAM para concluir o exemplo até a parte de dimensionamento.

### Implantar o hub da grade do Selenium:

Usaremos o Selenium Grid Hub para tornar a instalação do Selenium escalável por meio de um modelo mestre / trabalhador. O Selenium Hub é o mestre e os nós do Selenium são os trabalhadores (não devem ser confundidos com os nós do Kubernetes). Precisamos apenas de um hub, mas estamos usando um controlador de replicação para garantir que o hub esteja sempre em execução:

`` console
kubectl create --filename = staging / selenium / selenium-hub-deployment.yaml
`` ``

Os nós do Selenium precisarão saber como chegar ao Hub, vamos criar um serviço para os nós se conectarem.

`` console
kubectl create --filename = teste / selênio / selênio-hub-svc.yaml
`` ``

### Verifique a implantação do Selenium Hub

Vamos verificar nossa implantação do Selenium hub conectando-se ao console da web.

#### Nós Kubernetes acessíveis

Se seus nós do Kubernetes estiverem acessíveis na sua rede, você poderá verificar o hub pressionando-o na porta do nó. Você pode recuperar o nodeport digitando `kubectl description svc selenium-hub`, no entanto, o trecho abaixo automatiza isso usando a funcionalidade de modelo do kubectl:

`` console
export NODEPORT = `kubectl get svc --selector = 'app = selenium-hub' --output = template --template =" {{com índice .items 0}} {{com índice .spec.ports 0}} {{ .nodePort}} {{end}} {{end}} "`
export NODE = `kubectl get nodes --output = template --template =" {{with index .items 0}} {{. metadata.name}} {{end}} "`

enrolar http: // $ NODE: $ NODEPORT
`` ``

#### Nós do Kubernetes inacessíveis

Se você não conseguir acessar os nós do Kubernetes da sua rede, poderá fazer o proxy via kubectl.

`` console
export PODNAME = `kubectl get pods --selector =" app = selenium-hub "--output = template --template =" {{with index .items 0}} {{. metadata.name}} {{end}} "
kubectl port-forward $ PODNAME 4444: 4444
`` ``

Em um terminal separado, agora você pode verificar o status.

`` console
enrolar http: // localhost: 4444
`` ``

#### Como usar o Google Container Engine

Se você estiver usando o Google Container Engine, poderá expor seu hub pela Internet. Essa é uma péssima idéia por vários motivos, mas você pode fazer o seguinte:

`` console
kubectl expor a implantação selenium-hub --name = selenium-hub-external --labels = "app = selenium-hub, external = true" --type = LoadBalancer
`` ``

Então espere alguns minutos, eventualmente, seu novo serviço `selenium-hub-external` receberá um IP com balanceamento de carga do gcloud. Quando o `kubectl get svc selenium-hub-external` mostrar dois IPs, execute este trecho.

`` console
export INTERNET_IP = `kubectl get svc --selector =" app = selênio-hub, externo = true "- saída = modelo --template =" {{com índice .items 0}} {{com índice .status.loadBalancer. entrada 0}} {{. ip}} {{end}} {{end}} "`

enrolar http: // $ INTERNET_IP: 4444 /
`` ``

Agora você deve conseguir "$ INTERNET_IP" através do seu navegador da web, assim como todo mundo na Internet!

### Implante nós do Firefox e Chrome:

Agora que o Hub está ativo, podemos implantar trabalhadores.

Isso implantará 2 nós do Chrome.

`` console
kubectl create --filename = staging / selenium / selenium-node-chrome-deployment.yaml
`` ``

E 2 nós do Firefox para combinar.

`` console
kubectl create --filename = staging / selenium / selenium-node-firefox-deployment.yaml
`` ``

Depois que os pods começarem, você os verá aparecer na interface do Selenium Hub.

### Executar um trabalho Selenium

Vamos executar um trabalho rápido do Selenium para validar nossa configuração.

#### Configurar ambiente Python

Primeiro, precisamos iniciar um contêiner python ao qual possamos conectar.

`` console
O kubectl executa selênio-python --image = google / python-hello
`` ``

Em seguida, precisamos entrar neste contêiner.

`` console
exportar PODNAME = `kubectl get pods --selector =" executar = selênio-python "- saída = modelo --template =" {{com índice .items 0}} {{. metadata.name}} {{end}} "
kubectl exec --stdin = true --tty = true $ PODNAME bash
`` ``

Uma vez lá dentro, precisamos instalar a biblioteca Selenium

`` console
pip instalar selênio
`` ``

#### Executar trabalho do Selenium com Python

Estamos todos prontos, inicie o interpretador python.

`` console
Pitão
`` ``

E cole o conteúdo de selenium-test.py.

`` python
de selenium import webdriver
de selenium.webdriver.common.desired_capabilities import DesiredCapabilities

def check_browser (navegador):
  driver = webdriver.Remote (
    command_executor = 'http: // selenium-hub: 4444 / wd / hub',
    desejado_capabilidades = getattr (DesiredCapabilities, navegador)
  )
  driver.get ("http://google.com")
  afirmar "goo