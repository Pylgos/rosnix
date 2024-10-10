{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-adapter,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_parser" = substituteSource {
      src = fetchgit {
        name = "rosidl_parser-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "cfa2918fe3fba7824521c75587efdbf9699f3d42";
        hash = "sha256-/u0nPY8WCriPo5fUb/RNqTC4DMnbYtU0V+xV5Xmht4s=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_parser";
  version = "4.6.4-1";
  src = finalAttrs.passthru.sources."rosidl_parser";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-adapter ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lark-parser" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-adapter ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lark-parser" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The parser for `.idl` ROS interface files.";
  };
})
