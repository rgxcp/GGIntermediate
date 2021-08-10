# CI/CD with Travis

1. Sign up a new Travis account using your GitHub account.

2. Sync specific or all of your GitHub repositories to Travis.

3. Add `.travis.yml` file to the root of your project folder.

4. Push that changes to master.

5. Travis will automatically build your project, in case it didn't, click `More options` and choose `Trigger build`.

6. Generate a new GitHub personal access token with all `repo` scopes clicked.

7. Change your directory into your chosen project first.

   ```bash
   cd /path/to/your/project
   ```

8. Login into Travis using Travis CLI with your GitHub personal access token.

   ```bash
   travis login --github-token <YOUR_GITHUB_PERSONAL_ACCESS_TOKEN> --com
   ```

9. Encrypt your private SSH key using Travis CLI.

   ```bash
   travis encrypt-file <YOUR_PRIVATE_SSH_KEY> --add --com
   ```

10. Config your `.travis.yml` file as you like.
