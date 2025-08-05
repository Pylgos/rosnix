{
  ament-cmake,
  ament-cmake-mypy,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_parser";
  version = "5.0.1-1";
  src = finalAttrs.passthru.sources."rosidl_parser";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-adapter ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lark-parser" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-adapter ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lark-parser" ]; };
  checkInputs = [ ament-cmake-mypy ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_parser" = substituteSource {
      src = fetchgit {
        name = "rosidl_parser-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "c5573d8f9bad1c76524072de890671c228fd4ab1";
        hash = "sha256-Lw+jddNiWN0dW5pnaNCWi3t9f2d7VRU8zZXmzTmOOTw=";
      };
    };
  });
  meta = {
    description = "The parser for `.idl` ROS interface files.";
  };
})
