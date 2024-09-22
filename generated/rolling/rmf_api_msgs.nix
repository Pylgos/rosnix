{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_api_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_api_msgs-source";
        owner = "ros2-gbp";
        repo = "rmf_api_msgs-release";
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "python3-jsonschema" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RMF API msgs definition";
  };
}
