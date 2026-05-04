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
  version = "3.2.0-2";
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
        rev = "e33d429a87b432fc915c88acacf0a53ad7fc4228";
        hash = "sha256-jyYNgM8jtEAzAgGcfWvW18h98vDWkfUupObzySYun5k=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage of software for Leo Rover common to the robot and ROS desktop\n  ";
  };
})
