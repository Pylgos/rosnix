{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rosidl_cli-53b8898b7e5cfc687fa82dfb2f0d3e89d39340da = substituteSource {
      src = fetchgit {
        name = "rosidl_cli-53b8898b7e5cfc687fa82dfb2f0d3e89d39340da-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "53b8898b7e5cfc687fa82dfb2f0d3e89d39340da";
        hash = "sha256-X30BhGckqwyC/VfTB6oQWmvIeO8tCq8D0gioJNc8EnM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cli";
  version = "4.8.1-1";
  src = sources.rosidl_cli-53b8898b7e5cfc687fa82dfb2f0d3e89d39340da;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Command line tools for ROS interface generation.";
  };
}
