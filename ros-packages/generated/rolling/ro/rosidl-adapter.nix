{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cli,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_adapter" = substituteSource {
      src = fetchgit {
        name = "rosidl_adapter-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "af4b8d01d7b62ded8040ff8afae03002315bbb8d";
        hash = "sha256-Z4Dh1i3c0uVgC1INpsOPZg2x7yS3rTm9i9j2RUq3UDs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosidl_adapter";
  version = "4.8.1-1";
  src = sources."rosidl_adapter";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "python3-empy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "API and scripts to parse .msg/.srv/.action files and convert them to .idl.";
  };
}
