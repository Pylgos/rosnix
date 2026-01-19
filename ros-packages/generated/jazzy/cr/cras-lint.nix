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
  version = "3.0.0-2";
  src = finalAttrs.passthru.sources."cras_lint";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-lint-common ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ament-lint-common ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cras_lint" = substituteSource {
      src = fetchgit {
        name = "cras_lint-source";
        url = "https://github.com/ros2-gbp/cras_ros_utils-release.git";
        rev = "32a225b1ecf4d513849e180e8e68170312ee382f";
        hash = "sha256-XBN9uYInF5QjUMxkWL4wpQmdn3ofiYB6q9z7tt/3LGE=";
      };
    };
  });
  meta = {
    description = "Various utilities to work with bag files";
  };
})
