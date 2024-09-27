{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    acado-vendor_source-8366e22cd5d815078e8d24f78dbced28b48d7e32 = substituteSource {
      src = fetchgit {
        name = "acado-vendor_source-8366e22cd5d815078e8d24f78dbced28b48d7e32-source";
        url = "https://github.com/cho3/acado.git";
        rev = "8366e22cd5d815078e8d24f78dbced28b48d7e32";
        hash = "sha256-ExF4tV7ZpaL6BEwENt3CU+g2I1c2MOt0cs/Q9g/SSlI=";
      };
      substitutions = [
      ];
    };
    acado_vendor-1c399ec54ac905aa3daa46653014d56659fadb9a = substituteSource {
      src = fetchgit {
        name = "acado_vendor-1c399ec54ac905aa3daa46653014d56659fadb9a-source";
        url = "https://github.com/ros2-gbp/acado_vendor-release.git";
        rev = "1c399ec54ac905aa3daa46653014d56659fadb9a";
        hash = "sha256-8gA7ZwANcFmzyoc3egAGyB3xpAQlHrs4nK6U1/KanwA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/cho3/acado.git";
          to = "URL ${acado-vendor_source-8366e22cd5d815078e8d24f78dbced28b48d7e32}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/cho3/hpmpc.git";
          to = "URL ${hpmpc-vendor_source-abbcf0806e4c8763ab2129a90efd827d194c1b00}";
        }
      ];
    };
    hpmpc-vendor_source-abbcf0806e4c8763ab2129a90efd827d194c1b00 = substituteSource {
      src = fetchgit {
        name = "hpmpc-vendor_source-abbcf0806e4c8763ab2129a90efd827d194c1b00-source";
        url = "https://github.com/cho3/hpmpc.git";
        rev = "abbcf0806e4c8763ab2129a90efd827d194c1b00";
        hash = "sha256-KGC2+9ce1lyaxrPR5gApoB7Msk3bgTnKJYvBxDrHJDg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "acado_vendor";
  version = "1.0.0-6";
  src = sources.acado_vendor-1c399ec54ac905aa3daa46653014d56659fadb9a;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ament package for ACADO toolkit for MPC code generation";
  };
}
