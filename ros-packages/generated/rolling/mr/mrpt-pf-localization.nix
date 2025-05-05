{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-relocalization,
  mp2p-icp,
  mrpt-libgui,
  mrpt-libros-bridge,
  mrpt-libslam,
  mrpt-msgs,
  mrpt-msgs-bridge,
  mrpt-tutorials,
  nav-msgs,
  pose-cov-ops,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_pf_localization";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."mrpt_pf_localization";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto rclcpp ];
  propagatedBuildInputs = [ mola-relocalization mp2p-icp mrpt-libgui mrpt-libros-bridge mrpt-libslam mrpt-msgs mrpt-msgs-bridge nav-msgs pose-cov-ops sensor-msgs std-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ mrpt-tutorials ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_pf_localization" = substituteSource {
      src = fetchgit {
        name = "mrpt_pf_localization-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "18afee59a56a42d6f4feaef0fed31cc989e7563a";
        hash = "sha256-Yi3h3maLv5E/CFVLc5Olx6VqKsLsFbBVyxjoqzNsYag=";
      };
    };
  });
  meta = {
    description = "Package for robot 2D self-localization using dynamic or static (MRPT or ROS) maps. The interface is similar to amcl (https://wiki.ros.org/amcl) but supports different particle-filter algorithms, several grid maps at different heights, range-only localization, etc.";
  };
})
