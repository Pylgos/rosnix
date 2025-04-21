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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."leo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo-description leo-msgs leo-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "leo" = substituteSource {
      src = fetchgit {
        name = "leo-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "496ca3f136716a9a153103e46120b376741b7064";
        hash = "sha256-iQgyZJMs7pw07DBtPFKsFI9WSArAdENMufLQkAWmaWY=";
      };
    };
  });
  meta = {
    description = "Metapackage of software for Leo Rover common to the robot and ROS desktop";
  };
})
