{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_interface";
  version = "5.3.0-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_interface";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_interface" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_interface-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "8b207549d07d3da881bf3e557556d646e29c53d5";
        hash = "sha256-GhBzt0HAh2pcz6jjdVL/r21BnDMzRCPGU0bzrSpoIqE=";
      };
    };
  });
  meta = {
    description = "\n    The interface for rosidl typesupport packages.\n  ";
  };
})
