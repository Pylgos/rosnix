{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo-description,
  leo-msgs,
  leo-teleop,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."leo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo-description leo-msgs leo-teleop ];
  passthru = {
    sources = mkSourceSet (sources: {
      "leo" = substituteSource {
        src = fetchgit {
          name = "leo-source";
          url = "https://github.com/ros2-gbp/leo_common-release.git";
          rev = "fb908a97861b43c2c72b2ec5ed193a3adf0f5201";
          hash = "sha256-qRmRxzhzTgwKSELlVR4rhl4PT3KhP04L3wJCEVsnpSI=";
        };
      };
    });
  };
  meta = {
    description = "Metapackage of software for Leo Rover common to the robot and ROS desktop";
  };
})
