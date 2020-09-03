import subprocess
import os
import json

def gloss_table(gloss):
	table ="\n\n## Ordforklaringer \n\n"
	table += "|  |  |\n"
	table += "|--|--|\n"
	for word, definition in gloss.items():
		table += "| " + word + " | " + definition + " |\n"
	return table

def read_json(path):
	with open(path, encoding='utf-8') as f:
		content = json.load(f)
	return content

def excec(command):
	process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
	return process.communicate()

tmp = 'build/src'

if not os.path.exists("build"):
	excec("mkdir build")
	excec("cp -r src {}".format(tmp))

periods = os.listdir("{}/texts".format(tmp))

for period in periods:
	for f in os.listdir("{}/texts/{}".format(tmp, period)):
		extension = os.path.splitext(f)[1][1:]
		name = os.path.splitext(f)[0]
		namepath = "{}/texts/{}/".format(tmp, period) + name
		if (extension == "md"):
			if (os.path.exists(namepath + ".glossary.json")):
				with open(namepath + ".md", "a", encoding='utf-8') as myfile:
					myfile.write(gloss_table(read_json(namepath + ".glossary.json")))