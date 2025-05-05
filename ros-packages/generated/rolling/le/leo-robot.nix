{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo-bringup,
  leo-filters,
  leo-fw,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_robot";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."leo_robot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ leo leo-bringup leo-filters leo-fw ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-bringup leo-filters leo-fw ];
  passthru.sources = mkSourceSet (sources: {
    "leo_robot" = substituteSource {
      src = fetchgit {
        name = "leo_robot-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "ae7bafe4495e612e88d4ad3828bd93c7899d1e83";
        hash = "sha256-t5M1hlRmj8n4FIjKa0eICz9seOZ1voMKObMbNAvX1/M=";
      };
    };
  });
  meta = {
    description = "Metapackage of software to install on Leo Rover.";
  };
})
