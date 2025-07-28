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
  version = "4.9.5-1";
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
        rev = "60f1470b2d26b8158c22e5a849d0db125db41f46";
        hash = "sha256-j9zP7TDB0PjSZeAN9jcDL5WvxI7KY7xTYCIk+v+A4P8=";
      };
    };
  });
  meta = {
    description = "The parser for `.idl` ROS interface files.";
  };
})
