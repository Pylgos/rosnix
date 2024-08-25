{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_yaml = substituteSource {
      src = fetchgit {
        name = "mola_yaml-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "10bd50f9171b4b2a81ff6c8a2b262b3074437eb4";
        hash = "sha256-PK/0zeg5LiARHbxW8gnIvbwarS4QHc1Comli5CVyzSQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_yaml";
  version = "1.1.0-1";
  src = sources.mola_yaml;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "YAML helper library common to MOLA modules";
  };
}
