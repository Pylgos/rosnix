{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    osrf_testing_tools_cpp-72929ad603027203d6da59ab07cec0187c54beaa = substituteSource {
      src = fetchgit {
        name = "osrf_testing_tools_cpp-72929ad603027203d6da59ab07cec0187c54beaa-source";
        url = "https://github.com/ros2-gbp/osrf_testing_tools_cpp-release.git";
        rev = "72929ad603027203d6da59ab07cec0187c54beaa";
        hash = "sha256-Bi9mcQEbfiJ7oOCciXJR8uWeIrVxnqF81Ke202qC4do=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "osrf_testing_tools_cpp";
  version = "2.2.0-1";
  src = sources.osrf_testing_tools_cpp-72929ad603027203d6da59ab07cec0187c54beaa;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Testing tools for C++, and is used in various OSRF projects.";
  };
}
