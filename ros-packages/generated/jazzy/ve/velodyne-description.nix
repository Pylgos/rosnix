{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_description";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."velodyne_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne_description" = substituteSource {
      src = fetchgit {
        name = "velodyne_description-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "91a9e18e5cce0e4c64a5d4419e7b0ab226c37ea1";
        hash = "sha256-0YSpV+dpFbXMQsG+WjnQFtcIKCX65Jg3EzmFAd86m5w=";
      };
    };
  });
  meta = {
    description = "URDF and meshes describing Velodyne laser scanners.";
  };
})
