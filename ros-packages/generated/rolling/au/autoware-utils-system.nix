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
  version = "1.4.2-2";
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
        rev = "9088b8070c1a7501053cd957e6fd5b576a28ca35";
        hash = "sha256-cSz3O8oAcSD7BqK+92pEG4vvmZVNqaUrKZvj8sw11PE=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_system package";
  };
})
