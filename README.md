##### Схема сети
![Network](docs/network_scheme.png)

Для поднятия стэнда необходимо запустить:
``` bash
vagrant up && ansible-playbook playbooks/prep_stand_LACP_VLANs.yml
```
##### 1.LACP
После поднятия стэнда проверяем работу LACP
![LACP](docs/LACP_screen1.png)

Отключаем интерфейс eth1 на хосте centralRouter
![LACP](docs/LACP_screen2_eth1_down.png)

Видим что пакеты продолжают идти  
Поднимаем eth1 и отключаем eth2
![LACP](docs/LACP_screen2_eth2_down.png)

##### 2. VLANs

Проверяем интерфейсы на хостах
![VLANs](docs/VLAN_screen1_ipaddress.png)

Запускаем tcpdump на хостах testServer1 и testServer2  
Так же запускае ping с хостов testClient1 и testClient2
![VLANs](docs/VLAN_screen2_tcpdump.png)
