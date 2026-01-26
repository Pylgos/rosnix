{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  nav-msgs,
  octomap-msgs,
  octomap-ros,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "octomap_server";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."octomap_server";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ geometry-msgs message-filters nav-msgs octomap-msgs octomap-ros pcl-conversions pcl-ros rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ geometry-msgs message-filters nav-msgs octomap-msgs octomap-ros pcl-conversions pcl-ros rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "octomap_server" = substituteSource {
      src = fetchgit {
        name = "octomap_server-source";
        url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
        rev = "4cbb22d4a646c864ef400ad77258ff9fb6833b48";
        hash = "sha256-2jh7BXBXDMopGffnQ81BVS0j9IIDQdGvLS40L56lPOs=";
      };
    };
  });
  meta = {
    description = "\n    octomap_server loads a 3D map (as Octree-based OctoMap) and distributes it to other nodes in a compact binary format. It also allows to incrementally build 3D OctoMaps, and provides map saving in the node octomap_saver.\n  ";
  };
})
