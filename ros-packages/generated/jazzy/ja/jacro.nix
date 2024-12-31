{
  ament-cmake,
  ament-cmake-pytest,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "jacro";
  version = "0.2.0-2";
  src = finalAttrs.passthru.sources."jacro";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" ]; };
  propagatedBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-rich" ]; };
  checkInputs = [ ament-cmake-pytest std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pre-commit" ]; };
  passthru.sources = mkSourceSet (sources: {
    "jacro" = substituteSource {
      src = fetchgit {
        name = "jacro-source";
        url = "https://github.com/ros2-gbp/jacro-release.git";
        rev = "4a643ab72c0ba4963e5260f1bb428d320d9aff1d";
        hash = "sha256-GOJXhMMGAjLXb36duyMfkUl89UDpZkL6feDp485vnMg=";
      };
    };
  });
  meta = {
    description = "TODO: Project Short Description";
  };
})
