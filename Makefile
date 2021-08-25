.PHONY: answers
answers: clean
	# first copy the unfinished challenges over
	cp -r challenges/. /tmp/challenges/
	# clone challenge answers repo
	cd /tmp && git clone --depth 1 https://github.com/oldsj/devops-challenges-answers.git
	# copy the challenge answers into the challenge dir
	cp -r /tmp/devops-challenges-answers/challenges/. /tmp/challenges/

.PHONY: test
test: answers
	docker compose build
	docker compose run -v /tmp/challenges:/tmp/challenges shell 'bash /test/test.sh'

.PHONY: clean
clean:
	rm -rf /tmp/challenges
	rm -rf /tmp/devops-challenges-answers
