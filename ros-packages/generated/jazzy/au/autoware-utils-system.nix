{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_system";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_system";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_system" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_system-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "20e914b7458ce7ea9ccc4048934d5a12ed144053";
        hash = "sha256-cSz3O8oAcSD7BqK+92pEG4vvmZVNqaUrKZvj8sw11PE=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_system package";
  };
})
