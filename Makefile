.PHONY: commit apply

all: commit apply

commit:
	git add -A
	git commit -m "$$(date +'make commit on %d.%m.%y %H:%M:%S')"
apply: $HOME/ansible/bin/ansible
	$HOME/ansible/bin/ansible-playbook -i hosts site.yml

$HOME/ansible/bin/ansible: /usr/bin/virtualenv
	/usr/bin/virtualenv $HOME/ansible
	$HOME/ansible/bin/pip install ansible
/usr/bin/virtualenv:
	apt-get install -y python-virtualenv
