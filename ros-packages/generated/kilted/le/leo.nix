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
  version = "3.1.0-2";
  src = finalAttrs.passthru.sources."leo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ leo-description leo-msgs leo-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo-description leo-msgs leo-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "leo" = substituteSource {
      src = fetchgit {
        name = "leo-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "b53bb6217b74f74693d9c236576e092aba0f3f07";
        hash = "sha256-iQgyZJMs7pw07DBtPFKsFI9WSArAdENMufLQkAWmaWY=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage of software for Leo Rover common to the robot and ROS desktop\n  ";
  };
})
