package test

import (
	"context"
	"fmt"
	"github.com/google/go-github/v42/github"
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"golang.org/x/oauth2"
	"os"
	"strings"
	"testing"
)

// getGitHubClient Logs in and creates a Client object for the GitHub API
func getGitHubClient(t *testing.T, ctx context.Context, token string) *github.Client {
	logger.Log(t, "Logging in to GitHub")
	tokenSource := oauth2.StaticTokenSource(&oauth2.Token{AccessToken: token})
	httpClient := oauth2.NewClient(ctx, tokenSource)
	client := github.NewClient(httpClient)
	logger.Log(t, "Logged in to GitHub successfully")
	return client
}

// deleteGitHubRepos deletes a list of GitHub repos in a specific owner organization
func deleteGitHubRepos(t *testing.T, ctx context.Context, client *github.Client, owner string, names []string) {
	for _, name := range names {
		logger.Log(t, fmt.Sprintf("Deleting GitHub repo: \"%s\" in organization: \"%s\"", name, owner))
		resp, err := client.Repositories.Delete(ctx, owner, name)
		if err != nil || resp.StatusCode != 204 {
			panic(fmt.Sprintf("Unable to delete repo, %d, %s", resp.StatusCode, err))
		}
		logger.Log(t, "GitHub repo deleted successfully")
	}
}

// TestExamplesComplete tests a typical deployment of this module
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	names := []string{
		"terraform-github-repository-test1",
		"terraform-github-repository-test2",
	}

	ctx := context.Background()
	owner := os.Getenv("GITHUB_OWNER")
	token := os.Getenv("GITHUB_TOKEN")

	client := getGitHubClient(t, ctx, token)

	terraformOptions := &terraform.Options{
		TerraformDir:  "../../examples/complete",
		BackendConfig: map[string]interface{}{},
		EnvVars:       map[string]string{},
		Vars:          map[string]interface{}{},
	}
	defer deleteGitHubRepos(t, ctx, client, owner, names)

	terraform.InitAndApplyAndIdempotent(t, terraformOptions)

	logger.Log(t, "Asserting that terraform destroy will not succeed")
	resp, _ := terraform.DestroyE(t, terraformOptions)
	assert.True(t, strings.Contains(resp, "Instance cannot be destroyed"))
}
