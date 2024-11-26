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
  version = "4.6.4-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_interface";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_typesupport_interface" = substituteSource {
        src = fetchgit {
          name = "rosidl_typesupport_interface-source";
          url = "https://github.com/ros2-gbp/rosidl-release.git";
          rev = "5bf5a0d16d6cf1a47dc5f952a2f62854e8195582";
          hash = "sha256-kQxdJ7mirw4WofaEfh4lS6avIwbWrWHSd4YUk3DxWOo=";
        };
      };
    });
  };
  meta = {
    description = "The interface for rosidl typesupport packages.";
  };
})
