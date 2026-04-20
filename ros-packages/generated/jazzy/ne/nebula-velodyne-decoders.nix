{
  angles,
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-decoders,
  nebula-velodyne-common,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  velodyne-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_velodyne_decoders";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_velodyne_decoders";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ angles nebula-core-common nebula-core-decoders nebula-velodyne-common rclcpp velodyne-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ angles nebula-core-common nebula-core-decoders nebula-velodyne-common rclcpp velodyne-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nebula_velodyne_decoders" = substituteSource {
      src = fetchgit {
        name = "nebula_velodyne_decoders-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "64198a87eaa98e5d61ea0d076edc9361341d32f9";
        hash = "sha256-RoiXJWa0Nf3fWQxPNLh/YnFex2zydBTkWLAH+6nPBuw=";
      };
    };
  });
  meta = {
    description = "Nebula Velodyne Decoders Library";
  };
})
