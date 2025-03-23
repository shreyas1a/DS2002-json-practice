import json
with open('../data/schacon.repos.json', 'r') as inputf:
    info = json.load(inputf)
with open('chacon.csv', 'w') as outputf:
    for repos in info[:5]:  
        repo_name = repos.get("name")
        repo_url = repos.get("html_url")
        updated_at = repos.get("updated_at")
        visibility = repos.get("visibility", "public")
        outputf.write(f"{repo_name},{repo_url},{updated_at},{visibility}\n")


