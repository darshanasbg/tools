COMMIT=4824cc056f6d7a70cd0794d542851975339364c8
S_TAG=4.4.35
T_TAG=4.4.32

git checkout tags/v$S_TAG
git checkout $COMMIT

mvn versions:set -DprocessAllModules -DnewVersion=$T_TAG
mvn versions:commit -DprocessAllModules
#modify parent/pom.xml -> <carbon.kernel.version>4.4.32</carbon.kernel.version>

cd core/org.wso2.carbon.user.core
git add -A
mvn clean install -Dmaven.repo.local=m2
rm -r m2
cd ../../
git commit -m "$T_TAG kernel on commit $COMMIT"
git checkout -b user-role-cache-kernel-$T_TAG-on-commit-$COMMIT
git push origin user-role-cache-kernel-$T_TAG-on-commit-$COMMIT
