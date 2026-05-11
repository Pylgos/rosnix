{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-utils-geometry,
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
  pname = "autoware_vehicle_info_utils";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_vehicle_info_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-utils-geometry rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-utils-geometry rclcpp ];
  checkInputs = [ ament-cmake-ros ament-index-cpp ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_vehicle_info_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_vehicle_info_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "2f2766a31226ef071b92720993612b4ce6ac4dd9";
        hash = "sha256-NKVYOjSmlZWzKg/Ieb9S2kq1s91EVhO4tN611Zc0BDc=";
      };
    };
  });
  meta = {
    description = "The autoware_vehicle_info_utils package";
  };
})
