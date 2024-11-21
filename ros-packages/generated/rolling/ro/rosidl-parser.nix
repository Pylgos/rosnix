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
        rev = "9f7c16df8f29f1d5671b46a459db5a1d336b1e7f";
        hash = "sha256-MITsc+Mo853SQuw7u45clGIAI/VmyK8dYuTiR+oDJ+Q=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_parser";
  version = "4.9.1-1";
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
