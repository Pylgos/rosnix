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
  version = "4.9.3-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_interface";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_interface" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_interface-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "1c11ea187f2faae65830551c0d6519fea817394b";
        hash = "sha256-OJZJEPQcK/Y9AHOZp0OOa928uJrAr0H44hoKAl2aNz8=";
      };
    };
  });
  meta = {
    description = "The interface for rosidl typesupport packages.";
  };
})
