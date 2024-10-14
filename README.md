# cloud-network1
## Задание 1
Всех приветствую! Выполнил задание, код в репозитории:   
```
Задаем необходимые переменные:
export YC_CLOUD_ID='bla-bla-bla'
export YC_FOLDER_ID='bla-bla-bla'
export YC_TOKEN=$(yc iam create-token)
export YC_ZONE=ru-central1-b
export TF_VAR_ssh_key=$(cat /root/.ssh/id_rsa.pub)
terraform init
terraform apply


Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
[root@skillpropilserv-01 cloud-networks-local]# yc compute instances list
+----------------------+-------------+---------------+---------+----------------+----------------+
|          ID          |    NAME     |    ZONE ID    | STATUS  |  EXTERNAL IP   |  INTERNAL IP   |
+----------------------+-------------+---------------+---------+----------------+----------------+
| epd574slfri68lgchb8g | public-app  | ru-central1-b | RUNNING | 51.250.96.228  | 192.168.10.23  |
| epdaf3thflbcvf8c5dhg | gateway     | ru-central1-b | RUNNING | 51.250.106.150 | 192.168.10.254 |
| epdmg7q6rlft7rrs7lgu | private-app | ru-central1-b | RUNNING |                | 192.168.20.34  |
+----------------------+-------------+---------------+---------+----------------+----------------+

[root@skillpropilserv-01 cloud-networks-local]# ssh ubuntu@51.250.106.150
ubuntu@epdaf3thflbcvf8c5dhg:~$ curl https://2ip.ru
51.250.106.150

root@skillpropilserv-01 cloud-networks-local]# ssh ubuntu@51.250.96.228
ubuntu@epd574slfri68lgchb8g:~$ curl https://2ip.ru
51.250.96.228
```
