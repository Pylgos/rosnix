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
  version = "1.8.1-3";
  src = finalAttrs.passthru.sources."autoware_internal_metric_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_metric_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_metric_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "0c2a93ef6b423a5c58e88f74e7528547e1485d25";
        hash = "sha256-bYgXvs3j/n0JSogtAFB4jJH5X1VgF2VBKzS7HHxAI2M=";
      };
    };
  });
  meta = {
    description = "The autoware_internal_metric_msgs package";
  };
})
