{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    swri_prefix_tools = substituteSource {
      src = fetchgit {
        name = "swri_prefix_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "66405b88cb16e0f3544e6be10cd8c50296dee895";
        hash = "sha256-jIsfgQqTk62YMgEfLgaJB6ee4pZm5iTGxeQZ1Vi07zY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_prefix_tools";
  version = "3.6.1-2";
  src = sources.swri_prefix_tools;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.psutil ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Contains scripts that are useful as prefix commands for nodes started by roslaunch.";
  };
}
