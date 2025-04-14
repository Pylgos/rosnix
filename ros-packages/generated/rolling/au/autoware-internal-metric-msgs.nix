{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_internal_metric_msgs";
  version = "1.8.1-2";
  src = finalAttrs.passthru.sources."autoware_internal_metric_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_metric_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_metric_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "29bfa60cc3512cb7fbb349b63c4a244421d3f345";
        hash = "sha256-bYgXvs3j/n0JSogtAFB4jJH5X1VgF2VBKzS7HHxAI2M=";
      };
    };
  });
  meta = {
    description = "The autoware_internal_metric_msgs package";
  };
})
