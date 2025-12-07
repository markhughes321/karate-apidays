@articles @systemIntegration
Feature: Article Management Controller

  Scenario: Create, Get, and Delete Article Flow

    ## STEP 1: Create Article
    * def createResult = call read('classpath:conduit/steps/articles/postArticleOk.feature')
    * def articleSlug = createResult.response.article.slug

    ## STEP 2: Get Articles
    * call read('classpath:conduit/steps/articles/getArticlesOk.feature')

    ## STEP 2.1: UI Verification
    * driver articleUrl + articleSlug
    * waitForText('h1', createResult.response.article.title)
    * match text('.article-content p') contains 'Shifting left means testing earlier'
    * match text('.tag-list') contains 'testing'

    ## STEP 3: Delete Article
    * call read('classpath:conduit/steps/articles/deleteArticleOk.feature')