{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fusioncore-ros,
  mkSourceSet,
  nav-msgs,
  rclpy,
  robot-state-publisher,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fusioncore_gazebo";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."fusioncore_gazebo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ fusioncore-ros nav-msgs rclpy robot-state-publisher sensor-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ fusioncore-ros nav-msgs rclpy robot-state-publisher sensor-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "fusioncore_gazebo" = substituteSource {
      src = fetchgit {
        name = "fusioncore_gazebo-source";
        url = "https://github.com/manankharwar/fusioncore-release.git";
        rev = "7e2cced14ea9330ecb70febd9076748921a9eb7c";
        hash = "sha256-WM7eXqlPBZUZQf//oC472cw5nxktVb/3UBB0gTKISrw=";
      };
    };
  });
  meta = {
    description = "Gazebo simulation world for FusionCore integration testing";
  };
})
