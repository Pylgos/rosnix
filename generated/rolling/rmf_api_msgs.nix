{
  ament_cmake,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    rmf_api_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_api_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_api_msgs-release.git";
        rev = "e00c97a9caa5c230e340223351218723451a4785";
        hash = "sha256-rc8Swg0XQiFJxp4w99aTdLzz96JAXTgDzZEmLi32Uqs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_api_msgs";
  version = "0.4.0-1";
  src = sources.rmf_api_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.jinja2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json python3Packages.jsonschema ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "RMF API msgs definition";
  };
}
