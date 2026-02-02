{
  ament-cmake-core,
  ament-cmake-test,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cras_lint";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."cras_lint";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-lint-common ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ament-lint-common ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cras_lint" = substituteSource {
      src = fetchgit {
        name = "cras_lint-source";
        url = "https://github.com/ros2-gbp/cras_ros_utils-release.git";
        rev = "0282588648ebdd082f93d04f82c93194c4b03593";
        hash = "sha256-no3eJXtQCN0h3PczA/k92S4bB8h5kPErzQYnwHvaZKg=";
      };
    };
  });
  meta = {
    description = "Various utilities to work with bag files";
  };
})
