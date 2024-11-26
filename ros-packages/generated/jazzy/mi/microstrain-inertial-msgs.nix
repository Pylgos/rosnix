{
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "microstrain_inertial_msgs";
  version = "4.5.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "microstrain_inertial_msgs" = substituteSource {
        src = fetchgit {
          name = "microstrain_inertial_msgs-source";
          url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
          rev = "0adb0162cbc1650c1e5ff4e12d439e5ee26c15a5";
          hash = "sha256-90eMtSB6quluaCSqt1pHIBAq/QEzjpSamCHKws9zePY=";
        };
      };
    });
  };
  meta = {
    description = "A package that contains ROS message corresponding to microstrain message types.";
  };
})
