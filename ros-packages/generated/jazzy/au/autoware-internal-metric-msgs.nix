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
  version = "1.12.1-1";
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
        rev = "32ddad527902ba732183a3121a26498684c80031";
        hash = "sha256-XLdMVqGMzvgB05vwi0vfo7h4BTbUtNsFDqYiT+WbCc0=";
      };
    };
  });
  meta = {
    description = "The autoware_internal_metric_msgs package";
  };
})
