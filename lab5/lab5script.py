import json

with open('chacon.csv', 'w') as output_file:
    for repo_info in repositories[:5]:  
        repo_name = repo_info.get("name")
        repo_url = repo_info.get("html_url")
        last_updated = repo_info.get("updated_at")
        repo_visibility = repo_info.get("visibility", "public")
        output_file.write(f"{repo_name},{repo_url},{last_updated},{repo_visibility}\n")

with open('../data/schacon.repos.json', 'r') as input_file:
    repositories = json.load(input_file)
