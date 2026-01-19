{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_interfaces";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."easynav_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_interfaces" = substituteSource {
      src = fetchgit {
        name = "easynav_interfaces-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "4c78772039a50b62d4af362298604bbdc9af8a39";
        hash = "sha256-mYJVWVY8X/HHOoE0QIqNLDpjtkVTzso1qBPZkvwlh1I=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Message, Service, and Action definitions.";
  };
})
