package conduit;

import com.intuit.karate.junit5.Karate;

/**
 * Karate Test Runner for Conduit API Tests
 *
 * This runner class provides multiple options for running tests:
 * - Run all tests
 * - Run specific feature files
 * - Run by tags (@postLoginOk, @postLoginKo, @e2e, etc.)
 */
class ConduitRunner {

    /**
     * Run all tests in the conduit package
     */
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    /**
     * Run only the E2E controller tests
     */
    @Karate.Test
    Karate testE2EController() {
        return Karate.run("ConduitE2EController").relativeTo(getClass());
    }

    /**
     * Run the complete test suite via controller
     */
    @Karate.Test
    Karate testCompleteTestSuite() {
        return Karate.run("ConduitE2EController")
                .tags("@completeTestSuite")
                .relativeTo(getClass());
    }

    /**
     * Run only positive tests
     */
    @Karate.Test
    Karate testPositiveOnly() {
        return Karate.run("ConduitE2EController")
                .tags("@fullFlow")
                .relativeTo(getClass());
    }

    /**
     * Run only negative tests
     */
    @Karate.Test
    Karate testNegativeOnly() {
        return Karate.run("ConduitE2EController")
                .tags("@negativeTests")
                .relativeTo(getClass());
    }

    /**
     * Run only login feature tests
     */
    @Karate.Test
    Karate testLoginFeature() {
        return Karate.run("features/login").relativeTo(getClass());
    }

    /**
     * Run only article feature tests
     */
    @Karate.Test
    Karate testArticleFeature() {
        return Karate.run("features/articles").relativeTo(getClass());
    }

    /**
     * Run only delete article feature tests
     */
    @Karate.Test
    Karate testDeleteArticleFeature() {
        return Karate.run("features/delete-article").relativeTo(getClass());
    }

    /**
     * Run the article management E2E flow
     */
    @Karate.Test
    Karate testArticleManagement() {
        return Karate.run("features/article-management").relativeTo(getClass());
    }

    /**
     * Run tests by custom tags
     * Examples:
     * - @postLoginOk - successful login
     * - @postLoginKo - failed login attempts
     * - @postArticleOk - successful article creation
     * - @postArticleKo - failed article creation
     * - @deleteArticleOk - successful deletion
     * - @deleteArticleKo - failed deletion attempts
     * - @e2e - end-to-end flows
     */
    @Karate.Test
    Karate testByTags() {
        return Karate.run()
                .tags("@postLoginOk")  // Change this tag as needed
                .relativeTo(getClass());
    }
}
