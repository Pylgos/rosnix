{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "leo_gz_worlds" = substituteSource {
      src = fetchgit {
        name = "leo_gz_worlds-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "0b56515cc9fcb0a59080c1f37dbfaa6e9a46cbf7";
        hash = "sha256-EK1pczV1p2fHTbGPgwjCdNvPHbNkIXiSHcLDo6OfCGQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "leo_gz_worlds";
  version = "2.0.0-1";
  src = sources."leo_gz_worlds";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Gazebo worlds for Leo Rover simulation in ROS 2";
  };
}
