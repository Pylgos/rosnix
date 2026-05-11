{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-index-cpp,
  autoware-cmake,
  autoware-lanelet2-extension,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-utils-geometry,
  autoware-utils-visualization,
  autoware-vehicle-info-utils,
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
  pname = "autoware_marker_utils";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_marker_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-lanelet2-extension autoware-perception-msgs autoware-planning-msgs autoware-utils-geometry autoware-utils-visualization autoware-vehicle-info-utils rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "range-v3" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-lanelet2-extension autoware-perception-msgs autoware-planning-msgs autoware-utils-geometry autoware-utils-visualization autoware-vehicle-info-utils rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "range-v3" ]; };
  checkInputs = [ ament-cmake-ros ament-index-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_marker_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_marker_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "e7ec22d64d143cf154e4a28a6916057edb272c57";
        hash = "sha256-YBNVZxxvlmbwTPgAL8Mlc3i5IFV9HYF4NJ28TzW/6Xs=";
      };
    };
  });
  meta = {
    description = "The autoware_marker_utils package";
  };
})
