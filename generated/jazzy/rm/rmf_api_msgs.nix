{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_api_msgs-4418fc3b6cdc5ba308fae642fe43f33cf4953585 = substituteSource {
      src = fetchgit {
        name = "rmf_api_msgs-4418fc3b6cdc5ba308fae642fe43f33cf4953585-source";
        url = "https://github.com/ros2-gbp/rmf_api_msgs-release.git";
        rev = "4418fc3b6cdc5ba308fae642fe43f33cf4953585";
        hash = "sha256-Ak1dhux0ba8ujWuk1C3DYnT66cMNOm8TpfQXwo3I/BQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_api_msgs";
  version = "0.3.1-1";
  src = sources.rmf_api_msgs-4418fc3b6cdc5ba308fae642fe43f33cf4953585;
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
