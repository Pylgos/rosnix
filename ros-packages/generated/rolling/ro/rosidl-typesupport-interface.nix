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
  version = "4.9.2-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_interface";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_typesupport_interface" = substituteSource {
        src = fetchgit {
          name = "rosidl_typesupport_interface-source";
          url = "https://github.com/ros2-gbp/rosidl-release.git";
          rev = "f43c6f2046315ffefb3c2ebfd387d703965b9168";
          hash = "sha256-9ISVuNYA+tnUTB79c+/M8JXfAXnry6cYMjhsxmH/1fk=";
        };
      };
    });
  };
  meta = {
    description = "The interface for rosidl typesupport packages.";
  };
})
