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
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_parser";
  version = "4.6.5-1";
  src = finalAttrs.passthru.sources."rosidl_parser";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-adapter ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lark-parser" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-adapter ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lark-parser" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_parser" = substituteSource {
      src = fetchgit {
        name = "rosidl_parser-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "922d167661a10162b61df75c0f38d6e716246429";
        hash = "sha256-IUHVsudJ0+CaGmcAREV2nDayoPhWbl5EOdWIWpLDU0I=";
      };
    };
  });
  meta = {
    description = "The parser for `.idl` ROS interface files.";
  };
})
