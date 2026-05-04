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
  version = "3.0.2-2";
  src = finalAttrs.passthru.sources."cras_lint";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-lint-common ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ament-lint-common ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cras_lint" = substituteSource {
      src = fetchgit {
        name = "cras_lint-source";
        url = "https://github.com/ros2-gbp/cras_ros_utils-release.git";
        rev = "2d81f619f6cfc9814dab00ce96b0760432a8804a";
        hash = "sha256-plf6mA7kHYId7JC/09QiO/RFAhb4cLnWzBl414y9O00=";
      };
    };
  });
  meta = {
    description = "Various utilities to work with bag files";
  };
})
